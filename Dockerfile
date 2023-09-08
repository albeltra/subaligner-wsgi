FROM python:3.10.10-alpine

RUN python3 -m pip install flask==1.1.4 rq==1.12.0 gunicorn==20.1.0 markupsafe==2.0.1

RUN apk add --no-cache ffmpeg

COPY ./subaligner-standalone/app.py /scripts/

COPY ./subaligner-standalone/utils.py /scripts/

ENTRYPOINT ["gunicorn", "-b", "0.0.0.0", "--timeout", "600",  "--chdir", "/scripts", "app:app"]
  File "/subaligner/bin/subaligner", line 312, in main
    aligned_subs, audio_file_path, voice_probabilities, frame_rate = predictor.predict_single_pass(
  File "/subaligner/subaligner/predictor.py", line 79, in predict_single_pass
    subs, audio_file_path, voice_probabilities = self.__predict(
  File "/subaligner/subaligner/predictor.py", line 827, in __predict
    result["loss_pre_shift"] = log_loss(labels, voice_probabilities, eps=1 * 10 ** -5)
  File "/root/miniconda3/lib/python3.10/site-packages/sklearn/metrics/_classification.py", line 2402, in log_loss
    y_pred = check_array(y_pred, ensure_2d=False)
  File "/root/miniconda3/lib/python3.10/site-packages/sklearn/utils/validation.py", line 893, in check_array
    raise ValueError(
ffmpeg -y -xerror -i "/movies/One Ranger (2023)/One Ranger (2023) [1080p] [BluRay] [5.1] [YTS.MX].mp4" -map 0:a:0 -ac 2 -ar 16000 -vn "/tmp/tmp7naw41l9/One Ranger (2023) [1080p] [BluRay] [5.1] [YTS.MX].mp4.wav"
ERROR: Found array with dim 3. None expected <= 2.